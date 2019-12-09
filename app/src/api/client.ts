type Response<R> =
  | { status: "ok"; payload: R }
  | { status: "error"; message: string };

function post<T, R>(path: string, data: T): Promise<R> {
  return fetch(path, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  })
    .then(response => {
      return response.json() as Promise<Response<R>>;
    })
    .then(result => {
      switch (result.status) {
        case "error":
          throw Error(result.message);
        case "ok":
          return result.payload;
      }
    });
}

function get<R>(path: string): Promise<R> {
  return fetch(path, { method: "GET" })
    .then(response => {
      return response.json() as Promise<Response<R>>;
    })
    .then(result => {
      switch (result.status) {
        case "error":
          throw Error(result.message);
        case "ok":
          return result.payload;
      }
    });
}

export default {
  get,
  post,
};
